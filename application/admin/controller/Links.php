<?php
namespace app\admin\controller;
use \think\Controller;

class Links extends Controller
{

    public function index()
    {
    	return $this->fetch('/index');
    }
}
