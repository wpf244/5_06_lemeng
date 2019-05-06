<?php
namespace app\api\controller;

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
        $arr=[
            'error_code'=>0,
            'msg'=>'获取成功',
            'data'=>[
                'banner'=>$banner,
                
            ]
        ];
    
        echo \json_encode($arr);
    }
}