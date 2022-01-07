@extends('layouts.main')

@section('title','العملاء')

@section('maincontent')
    <div class="content-wrapper" >
        <div class="pagecontainer">
            <div style="display: inline-block;" >
                <a href="{{url('/project/create')}}" class="btn btn-primary ">  <i class="fa fa-plus"> </i> إضافة مشروع </a>
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
                  <th>إسم المستخدم</th>
                  <th>المسئول</th>
                  <th>الحالة</th>
                  <th>خيارات</th>
              </tr>
              </thead>
              <tbody>
              <?php $pos=1; ?>
              @foreach($projects as $project)
                  <tr id="{{$project->id}}">
                      <td>
                          {{$loop->iteration}}
                      </td>
                      <td>{{$project->name}}</td>
                      <td>{{$project->responsible}}</td>
                      <td>{{$project->project_status}}</td>
                       <td>
                          <a href="project/{{$project->id}}/edit" class="btn btn-primary" >  <i class="fas fa-edit"></i> تعديل </a>
                          <button class="btn btn-danger"   onclick="deleteConfirm({{$project->id}})" ><i class="fas fa-trash-alt"></i>  حذف </button>

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
            message     : "هل أنت متأكد من حذف المستخدم ؟",
            speed       : 500
        }).done(function() {

            var _token = $("input[name='_token']").val();
            $.ajax({
                url: "{{ url('users/1')}}",
                type:'DELETE',
                data: {
                    _token:_token
                    ,userid:row

                },
                success: function(result) {

                    if(result['status']) {
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
