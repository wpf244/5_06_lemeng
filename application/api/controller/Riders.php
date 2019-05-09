<?php
namespace app\api\controller;

use think\Request;

class Riders extends BaseHome
{
    public function lister()
    {
        $url=parent::getUrl();

        $uid=Request::instance()->header('uid');
        //改装展示
        $refit=db("riders")->where(["is_delete"=>0,"type"=>0])->order(["sort asc","id desc"])->select();

        foreach($refit as $k => $v){
            $refit[$k]['content']=strip_tags($v['content']);
            $re=db("assist")->where(["uid"=>$uid,"rid"=>$v['id']])->find();
            if($re){
                $refit[$k]['assist_status']=1;
            }else{
                $refit[$k]['assist_status']=0;
            }

            $refit[$k]['assess']=db("assess")->where(["rid"=>$v['id'],"status"=>1])->count();

            $shop=db("shop")->where(["id"=>$v['sid'],"is_delete"=>0])->find();

            $refit[$k]['logo']=$url.$shop['logo'];
            $refit[$k]['shopname']=$shop['name'];

            $img=db("riders_img")->where(["rid"=>$v['id'],'status'=>1])->select();

            foreach($img as $ks => $vs){
                $img[$ks]['image']=$url.$vs['image'];
            }
            $refit[$k]['img']=$img;


        }

        //配件展示
        $parts=db("riders")->where(["is_delete"=>0,"type"=>1])->order(["sort asc","id desc"])->select();

        foreach($parts as $kp => $vp){
            $parts[$kp]['content']=strip_tags($vp['content']);
            $re=db("assist")->where(["uid"=>$uid,"rid"=>$vp['id']])->find();
            if($re){
                $parts[$kp]['assist_status']=1;
            }else{
                $parts[$kp]['assist_status']=0;
            }

            $parts[$kp]['assess']=db("assess")->where(["rid"=>$vp['id'],"status"=>1])->count();

            $shops=db("shop")->where(["id"=>$vp['sid'],"is_delete"=>0])->find();

            $parts[$kp]['logo']=$url.$shops['logo'];
            $parts[$kp]['shopname']=$shops['name'];

            $imgs=db("riders_img")->where(["rid"=>$vp['id'],'status'=>1])->select();

            foreach($imgs as $kss => $vss){
                $imgs[$kss]['image']=$url.$vss['image'];
            }
            $parts[$kp]['img']=$img;


        }

        $arr=[
            'error_code'=>0,
            'msg'=>'获取成功',
            'data'=>[
                'refit'=>$refit,
                'parts'=>$parts,
            ]
        ];
        echo \json_encode($arr);
    }
    /**
    * 发布评价
    *
    * @return void
    */
    public function assess_save()
    {
        $uid=Request::instance()->header('uid');

        $data=input("post.");

        $data['uid']=$uid;

        $data['addtime']=time();

        $re=db("assess")->insert($data);

        if($re){
            $arr=[
                'error_code'=>0,
                'msg'=>'保存成功',
                'data'=>[]
            ];
        }else{
            $arr=[
                'error_code'=>1,
                'msg'=>'保存失败',
                'data'=>[]
            ];
        }
        echo \json_encode($arr);

    }
    /**
    * 点赞
    *
    * @return void
    */
    public function assist()
    {
        $uid=Request::instance()->header("uid");
        
        $rid=input("rid");
        
        $data['uid']=$uid;

        $data['rid']=$rid;

        $data['addtime']=time();
        
        $re=db("assist")->where(["uid"=>$uid,'rid'=>$rid])->find();

        if($re){

            db("assist")->where(["id"=>$re['id']])->delete();

            $res=db("riders")->where(["id"=>$rid])->setDec("assist",1);

            if($res){
                $arr=[
                    'error_code'=>0,
                    'msg'=>'操作成功',
                    'data'=>[]
                ];
            }else{
                $arr=[
                    'error_code'=>1,
                    'msg'=>'操作失败',
                    'data'=>[]
                ];
            }

        }else{
            db("assist")->insert($data);

            $res=db("riders")->where(["id"=>$rid])->setInc("assist",1);

            if($res){
                $arr=[
                    'error_code'=>0,
                    'msg'=>'操作成功',
                    'data'=>[]
                ];
            }else{
                $arr=[
                    'error_code'=>1,
                    'msg'=>'操作失败',
                    'data'=>[]
                ];
            }
        }


        echo \json_encode($arr);

    }
    /**
    * 展示详情
    *
    * @return void
    */
    public function detail()
    {
        $uid=Request::instance()->header("uid");

        $url=parent::getUrl();
        
        $rid=input("rid");

        db("riders")->where(["id"=>$rid])->setInc("browse",1);

        $re=db("riders")->where(["id"=>$rid])->find();

        $res=db("assist")->where(["uid"=>$uid,"rid"=>$rid])->find();

            if($res){
                $re['assist_status']=1;
            }else{
                $re['assist_status']=0;
            }

            $re['assess']=db("assess")->where(["rid"=>$rid,"status"=>1])->count();

            $shops=db("shop")->where(["id"=>$re['sid'],"is_delete"=>0])->find();

            $re['logo']=$url.$shops['logo'];
            $re['shopname']=$shops['name'];

            $imgs=db("riders_img")->where(["rid"=>$rid,'status'=>1])->select();

            foreach($imgs as $kss => $vss){
                $imgs[$kss]['image']=$url.$vss['image'];
            }
            $re['img']=$imgs;

            $comment=db("assess")->alias("a")->field("a.*,b.nickname,b.image")->where(["rid"=>$rid,"status"=>1])->join("user b","a.uid=b.uid")->select();

            $re['comment']=$comment;

            $arr=[
                'error_code'=>0,
                'msg'=>'操作成功',
                'data'=>$re
            ];

            echo \json_encode($arr);


    }




}