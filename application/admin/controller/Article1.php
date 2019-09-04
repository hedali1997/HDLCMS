<?php
namespace app\admin\controller;
use \think\Controller;

class Aryicle1 extends Controller
{

    public function index()
    {
    	return $this->fetch('/index');
    }
}
