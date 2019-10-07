<?php
namespace app\admin\controller;
use \think\Controller;

class Article extends Controller
{

    public function index()
    {
    	return $this->fetch('/list');
    }

    public function add()
    {
    	return $this->fetch('/add');
    }
}
