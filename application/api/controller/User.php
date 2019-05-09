<?php
namespace app\api\controller;

use think\Request;

class User extends BaseHome
{
    public function index()
    {
        $uid=Request::instance()->header("uid");

        $re=db("user")->field("nickname,image")->where(["uid"=>$uid])->find();

        $arr=[
            'error_code'=>0,
            'msg'=>'获取成功',
            'data'=>$re
        ];

        echo \json_encode($arr);
    }
    /**
    * 意见反馈
    *
    * @return void
    */
    public function opinion()
    {
        $uid=Request::instance()->header("uid");

        $data=input("post.");

        $data['uid']=$uid;

        $data['time']=time();

        $re=db("opinion")->insert($data);

        if($re){
            $arr=[
                'error_code'=>0,
                'msg'=>'提交成功',
                'data'=>[]
            ];
        }else{
            $arr=[
                'error_code'=>1,
                'msg'=>'提交失败',
                'data'=>[]
            ];
        }
        echo \json_encode($arr);
    }

    /**
    * 关于我们
    *
    * @return void
    */
    public function about()
    {
        $re=db("lb")->field("name,desc")->where("fid",3)->find();
        
        $arr=[
            'error_code'=>0,
            'msg'=>'获取成功',
            'data'=>$re
        ];
        
        echo \json_encode($arr);
    }

    /**
    * 我的预约
    *
    * @return void
    */
    public function my_order()
    {
        $uid=Request::instance()->header("uid");

        $res=db("order")->where(["uid"=>$uid])->select();

        if($res){
            $arr=[
                'error_code'=>0,
                'msg'=>'获取成功',
                'data'=>$res
            ];
            
         
        }else{
            $arr=[
                'error_code'=>1,
                'msg'=>'暂无数据',
                'data'=>[]
            ];
            
           
        }

        echo \json_encode($arr);

    }
    /**
    * 签到记录
    *
    * @return void
    */
    public function sign_in()
    {
        $uid=Request::instance()->header("uid");

        //签到规则
        $rule=db("lb")->field("desc")->where(["fid"=>4])->find();

        //用户签到记录
        $record=db("sign_in")->where(["uid"=>$uid])->whereTime('time', 'm')->order("id desc")->select();

        //用户今天是否已签到

        $user=db("sign_in")->where(["uid"=>$uid])->whereTime('time', 'd')->find();

        if($user){
            $sign_status=1;
        }else{
            $sign_status=0;
        }

        $arr=[
            'error_code'=>0,
            'msg'=>'获取成功',
            'data'=>[
                'record'=>$record,
                'sign_status'=>$sign_status,
                'rule'=>$rule,
                
            ]
        ];

        echo \json_encode($arr);

    }
    /**
    * 签到
    *
    * @return void
    */
    public function sign_save()
    {
        $uid=Request::instance()->header("uid");

        //用户今天是否已签到
        $user=db("sign_in")->where(["uid"=>$uid])->whereTime('time', 'd')->find();

        if($user){
            $arr=[
                'error_code'=>1,
                'msg'=>'今日已签到',
                'data'=>[]
            ];
        }else{
            //查询用户是否是连续签到
            $users=db("sign_in")->where(["uid"=>$uid])->whereTime('time', 'yesterday')->find();
            if($users){
                db("user")->where(["uid"=>$uid])->setInc("dates",1);
            }else{
                db("user")->where(["uid"=>$uid])->setField("dates",1);
            }
            $data['uid']=$uid;
            $data['time']=time();

            db("sign_in")->insert($data);
            $arr=[
                'error_code'=>0,
                'msg'=>'签到成功',
                'data'=>[]
            ];
        }
        echo \json_encode($arr);
    }

    /**
    * 我的洗车券
    *
    * @return void
    */
    public function my_car()
    {
        $uid=Request::instance()->header("uid");

        $res=db("car_dd")->where(["uid"=>$uid])->select();

        if($res){
            $arr=[
                'error_code'=>0,
                'msg'=>'获取成功',
                'data'=>$res
            ];
        }else{
            $arr=[
                'error_code'=>1,
                'msg'=>'暂无数据',
                'data'=>[]
            ];
        }
        echo \json_encode($arr);
    }
    /**
    * 使用洗车券
    *
    * @return void
    */
    public function car_save()
    {
        $id=input("id");
        $re=db("car_dd")->where(["id"=>$id])->find();
        if($re){
            if($re['status'] == 0){
                 $res=db("car_dd")->where(["id"=>$id])->update(["status"=>1,"times"=>time()]);
                 if($res){
                    $arr=[
                        'error_code'=>0,
                        'msg'=>'使用成功',
                        'data'=>[]
                    ];
                 }else{
                    $arr=[
                        'error_code'=>1,
                        'msg'=>'非法操作',
                        'data'=>[]
                    ];
                 }
            }else{
                $arr=[
                    'error_code'=>1,
                    'msg'=>'非法操作',
                    'data'=>[]
                ];
            }
        }else{
            $arr=[
                'error_code'=>1,
                'msg'=>'非法操作',
                'data'=>[]
            ];
        }
        echo \json_encode($arr);
    }

}