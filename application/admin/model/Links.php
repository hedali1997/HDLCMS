<?php 
namespace app\admin\model;
use think\Model;
use think\Db;

class Links extends Model 
{
	//自定义初始化 
	protected function initialize() 
	{ 
		//需要调用`Model`的`initialize`方法 
		parent::initialize();
		//TODO:自定义的初始化 
	}
	
	public function get_links()
	{
		return Db::name('links')->where('is_delete', 0)->order('sort desc, created_at desc, id desc')->select();
    }

    public function get_links_byid($id)
	{
		return Db::name('links')->where('id', $id)->where('is_delete', 0)->find();
    }
    
    public function insert_links($data)
    {
        return Db::name('links')->insertGetId($data);
    }

	public function update_links($id, $data)
	{
        $data['updated_at'] = date('Y-m-d H:i:s');
		return Db::name('links')->where('id', $id)->where('is_delete', 0)->update($data);
    }
    
    public function delete_links($id, $is_true = false)
    {
        if ($is_true) {
            return Db::name('links')->where('id',$id)->delete();
        } else {
            return Db::name('links')->where('id', $id)->setField('is_delete', 1);
        }
    }
}