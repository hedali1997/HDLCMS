<?php
namespace app\admin\controller;
use \think\Controller;

class Column extends Controller
{

    public function index()
    {
    	return $this->fetch('/index');
    }
}
