@extends('layouts.main')

@section('title','مشروعات العملاء')

@section('maincontent')
    <div class="content-wrapper" >
        <div class="pagecontainer">
            <div class="">
                <div class="form-group">
                    <p> العميل :  {{ $client->name }}</p>
                </div>
            </div>


 <div class="">
      <a href="{{action('ProjectController@projects',['id'=>$client->id])}}" class="btn btn-primary"> إضافة مشروع </a>
 </div>

        <table class="table  myGridClass table-hover ">
            <thead>
          <tr>
          {{--    <th>العميل</th>--}}
              <th>إسم المشروع</th>
              <th>تاريخ البدأ</th>
              <th>تاريخ الإنتهاء</th>
              <th>الحالة</th>
              <th></th>
          </tr>
            </thead>
            <tbody>
            @foreach($data as $project)
                <tr>
                    {{--<td>{{$project->id}}</td>--}}
                    <td>{{$project->name}}</td>
                    <td>{{$project->startdate}}</td>
                    <td>{{$project->enddate}}</td>
                    <td>{{$project->project_status}}</td>
                    <td>
                        <button class="btn btn-primary" >عرض</button>
                        <button class="btn btn-danger" >حذف</button>


                    </td>
                </tr>
            @endforeach
            </tbody>

      </table>
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

