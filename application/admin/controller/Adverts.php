<?php
namespace app\admin\controller;

use app\common\controller\MyController;
use think\Request;
use app\admin\model\Adverts as AdvertsModel;

class Adverts extends MyController
{
    private $advertsmodel;

    public function __construct()
    {
        parent::__construct();
        $this->advertsmodel = new AdvertsModel();
    }

    public function index()
    {
        $adverts = $this->advertsmodel->get_adverts();
        $this->assign('adverts',$adverts);
        return $this->fetch('/adverts');
    }

    public function edit()
    {
        $advert_id = Request::instance()->get('advert_id');
        $advert = $this->advertsmodel->get_adverts_byid($advert_id);
        $this->assign('advert',$advert);
        return $this->fetch('/edit_adverts');
    }

    public function update()
    {
        $adverts_data = Request::instance()->post();
        $row = $this->advertsmodel->update_adverts($adverts_data['id'],$adverts_data);
        if ($row > 0) {
            $this->success('修改成功！', 'Adverts/index');
        } else {
            $this->error('修改失败！');
        }
    }

    public function insert()
    {
        $adverts_data = Request::instance()->post();
        $row = $this->advertsmodel->insert_adverts($adverts_data);
        if ($row > 0) {
            $this->success('添加成功！', 'Adverts/index');
        } else {
            $this->error('添加失败！');
        }
    }
    
    public function delete_adverts()
    {
        $advert_id = Request::instance()->post('advert_id');
        $row = $this->advertsmodel->delete_adverts($advert_id);
        if ($row > 0) {
            $data = array('status' => 'success');
            return json_encode($data);
        } else {
            $data = array('status' => 'error');
            return json_encode($data);
        }
    }
}
