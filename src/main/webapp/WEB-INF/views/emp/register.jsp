<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Register</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Board Register</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <form role="form" action="/emp/register" method="post">
                    <div class="form-group">
                        <label>empName</label>
                        <input class="form-control" name='empName'>
                    </div>

                    <div class="form-group">
                        <label>pw</label>
                        <input class="form-control" name='pw'>
                    </div>

                    <div class="form-group">
                        <label>job</label>
                        <input class="form-control" name='job'>
                    </div>
                    <div class="form-group">
                        <label>phoneNum</label>
                        <input class="form-control" name='phoneNum'>
                    </div>
                    <div class="form-group">
                        <label>hireDate</label>
                        <input class="form-control" name='hireDate'>
                    </div>
                    <div class="form-group">
                        <label>annualLeaveNum</label>
                        <input class="form-control" name='annualLeaveNum'>
                    </div>

                    <div class="form-group">
                        <label>workDate</label>
                        <input class="form-control" name='workDate'>
                    </div>
                    <div class="form-group">
                        <label>birthDate</label>
                        <input class="form-control" name='birthDate'>
                    </div>

                    <button type="submit" class="btn btn-default">Submit
                        Button</button>
                    <button type="reset" class="btn btn-default">Reset Button</button>
                </form>



            </div>
            <!--  end panel-body -->

        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</div>
<!-- /.row -->