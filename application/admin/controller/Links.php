<?php
namespace app\admin\controller;

use app\common\controller\MyController;
use think\Request;
use app\admin\model\Links as LinksModel;

class Links extends MyController
{
    private $linksmodel;

    public function __construct()
    {
        parent::__construct();
        $this->linksmodel = new LinksModel();
    }

    public function index()
    {
        $links = $this->linksmodel->get_links();
        $this->assign('links',$links);
    	return $this->fetch('/links');
    }

    public function edit()
    {
        $link_id = Request::instance()->get('link_id');
        $link = $this->linksmodel->get_links_byid($link_id);
        $this->assign('link',$link);
        return $this->fetch('/edit_links');
    }

    public function update()
    {
        $links_data = Request::instance()->post();
        $row = $this->linksmodel->update_links($links_data['id'],$links_data);
        if ($row > 0) {
            $this->success('修改成功！', 'Links/index');
        } else {
            $this->error('修改失败！');
        }
    }

    public function insert()
    {
        $links_data = Request::instance()->post();
        $row = $this->linksmodel->insert_links($links_data);
        if ($row > 0) {
            $this->success('添加成功！', 'Links/index');
        } else {
            $this->error('添加失败！');
        }
    }
    
    public function delete_links()
    {
        $link_id = Request::instance()->post('link_id');
        $row = $this->linksmodel->delete_links($link_id);
        if ($row > 0) {
            $data = array('status' => 'success');
            return json_encode($data);
        } else {
            $data = array('status' => 'error');
            return json_encode($data);
        }
    }
}
