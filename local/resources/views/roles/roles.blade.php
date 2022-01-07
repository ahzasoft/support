@extends('layouts.main')

@section('title','إضافة صلاحية')

@section('maincontent')
    <div class="content-wrapper" >
        <div class="pagecontainer">
            <div style="display: inline-block;" >
                <a href="{{url('roles/add')}}" class="btn btn-primary ">  <i class="fa fa-plus"> </i> إضافة صلاحية </a>
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
                  <th>الصلاحية</th>
                  <th>خيارات</th>
              </tr>
              </thead>
              <tbody>
              <?php $pos=1; ?>
              @foreach($roles as $role)
                  <tr id="{{$role->id}}">
                      <td>
                          {{$loop->iteration}}
                      </td>
                      <td>{{$role->name}}</td>
                      <td>
                          <a href="roles/{{$role->id}}/edit" class="btn btn-primary" >  <i class="fas fa-edit"></i> تعديل </a>
                          <button class="btn btn-danger"   onclick="deleteConfirm({{$role->id}})" ><i class="fas fa-trash-alt"></i>  حذف </button>

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
            message     : "هل أنت متأكد من حذف الصلاحية ؟",
            speed       : 500
        }).done(function() {

            var _token = $("input[name='_token']").val();
            $.ajax({
                url: "{{ url('roles/1')}}",
                type:'DELETE',
                data: {
                    _token:_token
                    ,roleid:row

                },
                success: function(data) {
                    notifier.success(data);
                    var drow = document.getElementById(row);
                    drow.parentNode.removeChild(drow);
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
