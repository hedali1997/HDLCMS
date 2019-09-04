<?php
namespace app\admin\controller;
use \think\Controller;

class Comments extends Controller
{

    public function index()
    {
    	return $this->fetch('/index');
    }
}
