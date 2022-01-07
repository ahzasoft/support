@extends('layouts.main')

@section('title','العملاء')

@section('maincontent')
    <div class="content-wrapper" >
        <div class="pagecontainer">
            <div style="display: inline-block;" >
                <a href="{{url('/clients/create')}}" class="btn btn-primary ">  <i class="fa fa-plus"> </i> إضافة عميل </a>
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
                  <th>الحالة</th>
                  <th>خيارات</th>
              </tr>
              </thead>
              <tbody>
              <?php $pos=1; ?>
              @foreach($clients as $client)
                  <tr id="{{$client->id}}">
                      <td>
                          {{$loop->iteration}}
                      </td>
                      <td>{{$client->name}}</td>
                      <td>{{$client->mobile}}</td>
                      <td>{{$client->email}}</td>
                      <td>
                          @if($client->status)
                              <span>Active</span>
                          @else
                              <span>Not Active</span>
                         @endif
                      </td>
                       <td>
                           <div class="dropdown show">
                               <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                   Action
                               </a>

                               <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                   <a class="dropdown-item" href="clients/{{$client->id}}/edit">تعديل</a>
                                   <button class="dropdown-item btn btn-danger"   onclick="deleteConfirm({{$client->id}})" ><i class="fas fa-trash-alt"></i>  حذف </button>
                                   <a class="dropdown-item" href="/client/payments/{{$client->id}}">مدفوعات</a>
                                   <a class="dropdown-item" href="/client/clientproject/?id={{$client->id}}">المشروعات</a>
                                   <a class="dropdown-item" href="/tickets?id={{$client->id}}">التذاكر</a>
                                   <a class="dropdown-item" href="#">الرسائل</a>
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
