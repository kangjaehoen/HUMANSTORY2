<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet"
      href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
        src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>



<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Register</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">

        <div class="col col-lg-2"></div>

        <div class="panel panel-default col col-md-auto">

            <div class="panel-heading">Board Register</div>
            <!-- /.panel-heading -->
            <div class="panel-body">


                <form role="form" action="/emp/register" method="post">
                    <div class="form-group">
                        <label>image</label>
                        <input class="form-control" name="img-thumbnail">
                        <img src="" class="img-thumbnail" alt="">
                    </div>

                    <div class="form-group">
                        <label>empName</label>
                        <input class="form-control" name='empName' placeholder="jongwon">
                    </div>

                    <div class="form-group">
                        <label>pw</label>
                        <input class="form-control" name='pw' placeholder="twice1597">
                    </div>

                    <div class="form-group">
                        <label>job</label>
                        <input class="form-control" name='job' placeholder="대리">
                    </div>
                    <div class="form-group">
                        <label>phoneNum</label>
                        <input class="form-control" name='phoneNum' placeholder="26467154">
                    </div>
                    <div class="form-group">
                        <label>hireDate</label>
                        <input class="form-control" name='hireDate' placeholder="97/03/05">
                    </div>
                    <div class="form-group">
                        <label>email</label>
                        <input class="form-control" name='email' placeholder="p73648@naver.com">
                    </div>

                    <div class="form-group">
                        <label>address</label>
                        <input class="form-control" name='address' placeholder="경기도 성남시 수정구 산성동">
                    </div>
                    <div class="form-group">
                        <label>workDate</label>
                        <input class="form-control" name='workDate' placeholder="240417">
                    </div>
                    <div class="form-group">
                        <label>birthDate</label>
                        <input class="form-control" name='birthDate' placeholder="5/03">
                    </div>
                    <div class="form-group">
                        <label>deptNum</label>
                        <input class="form-control" name='deptNum'placeholder="1">
                    </div>
                    <div class="form-group">
                        <input type="hidden" class="form-control" name='Enabled' value="1">
                    </div>

                    <button type="submit" class="btn btn-primary">Submit
                        Button</button>
                    <button type="reset" class="btn btn-default">Reset Button</button>
                </form>
            </div>
            <!--  end panel-body -->
            <div class="col col-lg-2"></div>

        </div>
        <!--  end panel-body -->
</div>
<!-- /.row -->