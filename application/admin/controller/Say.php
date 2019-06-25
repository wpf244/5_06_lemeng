<?php
namespace app\admin\controller;

class Say extends BaseAdmin
{
    public function lister()
    {
       
        $list=db("say")->order(["sort asc","id desc"])->paginate(20,false,['query'=>request()->param()]);
        $this->assign("list",$list);

        $page=$list->render();
        $this->assign("page",$page);
       
        return $this->fetch();
    }
    public function save(){
        $id=input('id');
        if($id){
            $data=input('post.');
            $re=db('say')->where("id=$id")->find();
           
            if(input('status')){
                $data['status']=1;
            }else{
                $data['status']=$re['status'];
            }
            $res=db("say")->where("id",$id)->update($data);
            if($res){
                $this->success("修改成功！");
            }else{
                $this->error("修改失败！");
            }
        }else{
            $data=input('post.');
            
            if(input('status')){
                $data['status']=1;
            }
    
            $re=db("say")->insert($data);
            if($re){
                $this->success("添加成功！");
            }else{
                $this->error("添加失败！");
            }
        }
         
    }
    public function modify(){
        $id=input('id');
        $re=db('say')->where("id=$id")->find();
    
        echo json_encode($re);
    }
    public function change(){
        $id=input('id');
        $re=db('say')->where("id=$id")->find();
        if($re){
            if($re['status'] == 0){
                $res=db('say')->where("id=$id")->setField("status",1);
            }
            if($re['status'] == 1){
                $res=db('say')->where("id=$id")->setField("status",0);
    
            }
            echo '0';
        }else{
            echo '1';
        }
    }
    public function delete(){
        $id=input('id');
        $re=db('say')->where("id=$id")->find();
        if($re){
            $del=db('say')->where("id=$id")->delete();
            echo '1';
        }else{
            echo '0';
        }
    }
    public function sort(){
        $data=input('post.');
        foreach ($data as $id => $sort){
            db('say')->where(array('id' => $id ))->setField('sort' , $sort);
        }
        $this->redirect('lister');
    }
    public function delete_all(){
        $id=input('id');
        $arr=explode(",", $id);
        foreach ($arr as $v){
            $re=db('say')->where("id=$v")->find();
            if($re){
                $del=db('say')->where("id=$v")->delete();
        }
        
       }
      
        $this->redirect('lister');
       
       
    }
    public function img(){
        $id=input('id');
        $list=db('say_img')->where("rid=$id")->paginate(10);
        $this->assign("list",$list);
        
        $page=$list->render();
        $this->assign("page",$page);
        
        $this->assign("id",$id);
        
        return $this->fetch();
    }
    public function i_save(){
        $id=input('id');
        if($id){
            $data=input('post.');
            $re=db('say_img')->where("id=$id")->find();
            if(!is_string(input('image'))){
                $data['image']=uploads("image");
            }else{
                $data['image']=$re['image'];
            }
            if(input('status')){
                $data['status']=1;
            }else{
                $data['status']=$re['status'];
            }
            $res=db("say_img")->where("id",$id)->update($data);
            if($res){
                $this->success("修改成功！");
            }else{
                $this->error("修改失败！");
            }
        }else{
            $data=input('post.');
            if(!is_string(input('image'))){
                $data['image']=uploads("image");
            }
            if(input('status')){
                $data['status']=1;
            }
    
            $re=db("say_img")->insert($data);
            if($re){
                $this->success("添加成功！");
            }else{
                $this->error("添加失败！");
            }
        }
         
    }
    public function modify_i(){
        $id=input('id');
        $re=db('say_img')->where("id=$id")->find();
    
        echo json_encode($re);
    }
    public function change_i(){
        $id=input('id');
        $re=db('say_img')->where("id=$id")->find();
        if($re){
            if($re['status'] == 0){
                $res=db('say_img')->where("id=$id")->setField("status",1);
            }
            if($re['status'] == 1){
                $res=db('say_img')->where("id=$id")->setField("status",0);
    
            }
            echo '0';
        }else{
            echo '1';
        }
    }
    public function delete_i(){
        $id=input('id');
        $re=db('riders_img')->where("id=$id")->find();
        if($re){
            $del=db('riders_img')->where("id=$id")->delete();
            echo '1';
        }else{
            echo '0';
        }
    }

}