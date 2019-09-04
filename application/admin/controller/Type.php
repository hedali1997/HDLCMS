<?php
namespace app\admin\controller;
use \think\Controller;

class Type extends Controller
{

    public function index()
    {
    	return $this->fetch('/index');
    }
}
