@extends('layouts.main')

@section('title','التذاكر')

@section('maincontent')
    <div class="content-wrapper" >
        <div class="pagecontainer" style="max-width: 100%">
            <div style="display: inline-block;" >
                <a href="{{url('/tickets/create')}}" class="btn btn-primary ">  <i class="fa fa-plus"> </i> إضافة تذكرة </a>
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
                  <th>إسم العميل</th>
                  <th>رقم الموبيل</th>
                  <th>إيميل</th>
                  <th>التذكرة</th>
                  <th>تاريخ التسجيل</th>
                  <th>تاريخ التعديل</th>
                  <th>حالة التذكرة</th>
                  <th>خيارات</th>
              </tr>
              </thead>
              <tbody>
              <?php $pos=1; ?>
              @foreach($tickets as $ticket)
                  <tr id="{{$ticket->id}}">
                      <td>{{$loop->iteration}} </td>
                      <td>                     {{$ticket->name}}                      </td>
                      <td>{{$ticket->mobile}}</td>
                      <td>{{$ticket->email}}</td>
                      <td>{{$ticket->title}}</td>
                      <td>{{$ticket->created_at}}</td>
                      <td>{{$ticket->updated_at}}</td>
                      <td>{{$ticket->ticket_status}} </td>

                       <td>
                           <div class="dropdown show">
                               <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                   الإجراء
                               </a>

                               <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                   <a class="dropdown-item" href="/tickets/{{$ticket->id}}/edit"><i class="fas fa-eye"></i> عرض </a>
                                   <a class="dropdown-item" href="{{url('/tickets/managment',$ticket->id)}}" ><i class="fas fa-edit"></i> تعديل </a>
                                   <a class="dropdown-item" href="{{action('TicketsController@addtoclient',$ticket->id)}}" ><i class="fas fa-user"></i> إضافة عميل </a>
                                   <button class="dropdown-item btn btn-danger"   onclick="deleteConfirm({{$ticket->id}})" ><i class="fas fa-trash-alt"></i>  حذف </button>

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


    <div class="modal fade brands_modal" tabindex="-1" role="dialog"
         aria-labelledby="gridSystemModalLabel">
    </div>

@endsection

@section('javascript')
<script>
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
        var container = $(this).data('container'); /*.brands_modal*/
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

</script>


@endsection
