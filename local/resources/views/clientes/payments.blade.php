@extends('layouts.main')

@section('title','العملاء')

@section('maincontent')
    <div class="content-wrapper" >
        <div class="pagecontainer">
            <div class="">
                <h3>العميل : {{$client->name}}</h3>
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <div class="form-group">
                        {!! Form::label('datefrom','تاريخ السداد  من ') !!}
                        {!! Form::text('datefrom', null, ['class' => 'form-control date-picker', 'required', 'placeholder' =>'تاريخ السداد' ]); !!}
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="form-group">
                        {!! Form::label('dateto','تاريخ السداد  إلي ') !!}
                        {!! Form::text('dateto', null, ['class' => 'form-control date-picker', 'required', 'placeholder' =>'تاريخ السداد' ]); !!}
                    </div>
                </div>
            </div>





            <div style="display: inline-block;" style="margin-top: 10px" >
                 <button class="btn btn-primary" onclick="addpayment({{$client->id}})"><i class="fa fa-plus"> </i> إضافة </button>
            </div>

            <div>
                @if ($message = Session::get('success'))
                    <div class="alert alert-success">
                        <p>{{ $message }}</p>
                    </div>
                @endif



                <table class="table  myGridClass table-hover ">
                    <thead>
                    <tr>
                        <th style="width: 80px;">م</th>
                        <th>تاريخ السداد</th>
                         <th>قيمة مسددة</th>
                        <th>الحالة</th>
                        <th>خيارات</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $pos=1; ?>
                  @foreach($payments as $payment)
                      <tr>
                      <td>{{$loop->iteration}}</td>
                        <td>{{$payment->created_at}}</td>
                        <td>{{$payment->value}}</td>
                        <td>{{$payment->status}}</td>
                        <td>
                            <div class="dropdown show">
                                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Action
                                </a>

                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="clients/{{$payment->id}}/edit">تعديل</a>
                                    <button class="dropdown-item btn btn-danger"   onclick="deleteConfirm({{$client->id}})" ><i class="fas fa-trash-alt"></i>  حذف </button>

                                </div>
                            </div>
                        </td>

                      </tr>
                    @endforeach

                    </tbody>
                </table>

            </div>
        </div>
    </div>


    <div class="modal fade div-modal" tabindex="-1" role="dialog">

    </div>

@endsection

@section('javascript')
    <script>

        $( ".date-picker" ).datepicker({
            dateFormat:'yy-mm-dd'
        });
        function deleteConfirm(row)
        {
            $.MessageBox({
                buttonDone  : "Yes",
                buttonFail  : "No",
                message     : "هل أنت متأكد من حذف العميل ؟",
                speed       : 500
            }).done(function() {

                var _token = $("input[name='_token']").val();
                $.ajax({
                    url: "{{ url('clients/1')}}",
                    type:'DELETE',
                    data: {
                        _token:_token
                        ,userid:row

                    },
                    success: function(result) {

                        if(result['success']==true) {
                            notifier.success(result['masseg']);
                            var drow = document.getElementById(row);
                            drow.parentNode.removeChild(drow);
                        }else {
                            notifier.alert(result['masseg']);
                        }
                    }
                });

            });
        }

        $(document).on('click', '.btn-modal', function(e) {
            e.preventDefault();
            var container = $(this).data('container');
            $.ajax({
                url: $(this).data('href'),
                dataType: 'html',
                success: function(result) {
                    $(container)
                        .html(result)
                        .modal('show');
                },
            });
        });


        function addpayment(id) {
            $.ajax({
                url: '/client/addpayment',
                dataType: 'html',
                data:{
                    client_id:id
                },
                success: function(result) {
                    $('.div-modal')
                        .html(result)
                        .modal('show');
                },
            });
        }

    </script>


@endsection
