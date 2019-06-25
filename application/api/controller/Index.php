<?php
namespace app\api\controller;

use think\Request;

class Index extends BaseHome
{
    public function index()
    {
        $url=parent::getUrl();
        //轮播图
        $banner = db("lb")->field("id,image")->where(['fid'=>1,'status'=>1])->order(["sort asc","id desc"])->select();

        foreach($banner as $k => $v){
            $banner[$k]['image']=$url.$v['image'];
        }

        //汽车预约广告
        $make=db("lb")->field("id,name,desc")->where("fid",2)->find();
        $make['desc']=strip_tags($make['desc']);

        //优质商户
        $shop=db("shop")->field("id,image")->where(["is_delete"=>0,"up"=>1,'status'=>1])->order(["sort asc","id desc"])->select();
        foreach($shop as $ks => $vs ){
            $shop[$ks]['image']=$url.$vs['image'];
        }

        $arr=[
            'error_code'=>0,
            'msg'=>'获取成功',
            'data'=>[
                'banner'=>$banner,
                'make'=>$make,
                'shop'=>$shop,
                
            ]
        ];
    
        echo \json_encode($arr);
    }
    /**
    * 店铺列表
    *
    * @return void
    */
    public function shop()
    {
        $url=parent::getUrl();
        $res=db("shop")->field("id,name,logo,addr,phone")->where(["is_delete"=>0,"up"=>1])->order(["sort asc","id desc"])->select();
        if($res){
            foreach($res as $ks => $vs ){
                $res[$ks]['logo']=$url.$vs['logo'];
            }
            $arr=[
                'error_code'=>0,
                'msg'=>'获取成功',
                'data'=>$res
            ];
        }else{
            $arr=[
                'error_code'=>0,
                'msg'=>'获取成功',
                'data'=>[
                    
                ]
            ];
        }
        echo \json_encode($arr);
        
    }
    /**
    * 商户详情
    *
    * @return void
    */
    public function shop_detail()
    {
        $url=parent::getUrl();
        $id=input("id");
        $re=db("shop")->where(["id"=>$id,"is_delete"=>0,"up"=>1])->find();
        $re['logo']=$url.$re['logo'];
        $re['image']=$url.$re['image'];
        $arr=[
            'error_code'=>0,
            'msg'=>'获取成功',
            'data'=>$re
        ];
        echo \json_encode($arr);
    }
    /**
    * 预约 查找是否设置默认车辆
    *
    * @return void
    */
    public function order()
    {
        $uid=Request::instance()->header("uid");

        $re=db("order")->field("code,car_type,color,username,phone")->where(["uid"=>$uid,"defualt"=>1])->find();

        if($re){
            $arr=[
                'error_code'=>0,
                'msg'=>'获取成功',
                'data'=>$re
            ];
        }else{
            $arr=[
                'error_code'=>1,
                'msg'=>'获取失败',
                'data'=>''
            ];
        }
        echo \json_encode($arr);
    }
    /**
    * 保存预约
    *
    * @return void
    */
    public function order_save()
    {
        $uid=Request::instance()->header("uid");

        $data=input("post.");

        $data['uid']=$uid;

        $data['time']=time();

        $re=db("order")->insert($data);

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
    public function up()
    {
        $re=db("lb")->field("desc,image")->where(["fid"=>5,"status"=>1])->find();
        if($re){
            $url=parent::getUrl();
            $re['desc']=strip_tags($re['desc']);
            $re['image']=$url.$re['image'];
            $arr=[
                'error_code'=>0,
                'msg'=>'获取成功',
                'data'=>$re
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
    * 云商
    *
    * @return void
    */
    public function say()
    {
        $res=db("say")->field("id,name")->where("status",1)->order(["sort asc","id desc"])->select();

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
    * 产品详情
    *
    * @return void
    */
    public function say_detail()
    {
        $id=input("id");

        $res=db("say_img")->field("image")->where(["rid"=>$id,"status"=>1])->select();

        if($res){
            $url=parent::getUrl();
            foreach($res as $k => $v){
                $res[$k]['image']=$url.$v['image'];
            }
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



}