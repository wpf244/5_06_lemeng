<?php
namespace app\api\controller;

use think\Controller;
use think\Request;
use Think\Db;

class Login extends Controller
{
     /**
    * 授权登录
    *
    * @return void
    */
    public function login()
    {
        $code=input('code');

        $fid = Request::instance()->param('fid', 0);
        if($fid != 0){
            $data['fid']=$fid;
        }
        $payment=db("payment")->where("id",1)->find();
        $appid = $payment['appid'];
        $secret = $payment['appsecret'];
        $url="https://api.weixin.qq.com/sns/jscode2session?appid=".$appid."&secret=".$secret."&js_code=".$code."&grant_type=authorization_code";
        $results=json_decode(file_get_contents($url),true);
        $openid=$results['openid'];
        if(!$openid){
            $arr=[
                'error_code'=>1,
                'msg'=>'openID获取失败',
                'data'=>''
            ];
        }else{
            
            $data['openid']=$openid;
            $data['nickname']=\input('nickname');
            $data['image']=\input('image');
            $data['time']=\time();
            $ret=db('user')->where(array('openid'=>$openid))->find();
            if($ret['openid']){
                $res=db("user")->where(array('openid'=>$openid))->update($data);
                    $arr=[
                        'error_code'=>0,
                        'msg'=>'授权成功',
                        'data'=>[
                            'uid'=>$ret['uid'],
                        ]
                    ];
            }else{
                $rea=db('user')->insert($data);
                $uid=db('user')->getLastInsID();
                if($rea){
                    $arr=[
                        'error_code'=>0,
                        'msg'=>'授权成功',
                        'data'=>[
                            'uid'=>$uid,
                        ]
                    ];
    
                }else{
                    $arr=[
                        'error_code'=>2,
                        'msg'=>'授权失败',
                        'data'=>''
                    ];
                }
               
            }
        }
        echo \json_encode($arr);
    }

    /**
    * 连续签到满30天 送洗车券一张
    *
    * @return void
    */
    public function plan()
    {
        $res=db("user")->where(["is_delete"=>0])->select();

        foreach($res as $v){
            if($v['dates'] == 30){
                 // 启动事务
                 Db::startTrans();
                 try{
                    db("user")->where("uid",$v['uid'])->setField("dates",0);
                    $data['uid']=$v['uid'];
                    $data['time']=time();
                    db("car_dd")->insert($data);
                     // 提交事务
                     Db::commit();   
                    
                 } catch (\Exception $e) {
                     // 回滚事务
                     Db::rollback();
                  
                 }
            }
        }
    }

}