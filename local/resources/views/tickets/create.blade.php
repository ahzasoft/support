@extends('layouts.main')

@section('title','إضافة تذكرة')

@section('maincontent')
    <div class="content-wrapper" >
        <div class="pagecontainer">

            <form method="POST" action="{{'/tickets' }}" enctype="multipart/form-data">
                @csrf
                <input type="hidden" value="{{$ticket->id}}" name="ticket_id">
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="title">عنوان التذكرة</label>
                            <input type="text" id="title" name="title" class="form-control" value=" {{$ticket->title}} " autofocus autocomplete="name"/>
                        {{-- @if($errors->first('titel'))   <div class="alert alert-danger">{{ $errors->first('titel') }}</div> @endif--}}

                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="price">نوع التذكرة</label>
                            <select class="form-control" name="ticket_type">
                                <option value="0">إختر نوع التذكرة</option>
                                @foreach($ticket_type as $type)
                                 <option value="{{$type->id}}" @if($ticket->type==$type->id) selected @endif     >{{$type->type}}</option>
                                @endforeach
                            </select>

                            </div>
                    </div>





                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="status">حالة التذكرة </label>
                            <select id="status" name="status" class="form-control">
                                @foreach($ticket_status as $status)
                                    <option value="{{$status->id}}" @if($status->id==$ticket->status) selected @endif >{{$status->ticket_status}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="project">المشروع </label>
                            <select id="project" name="project" class="form-control">
                            <option value="0" >مشروع جديد</option>
                                @foreach($projects as $project)
                                    <option value="{{$project->id}}" @if($project->id==$ticket->project_id) selected @endif     >
                                        {{$project->name}}-
                                        <span style="display: block;color: #FFFFFF;background-color: #ee3148">{{$project->project_status}}</span>
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>تفاصيل التذكرة </label>
                             <textarea class="form-control" name="notes" id="notes" >{{old('notes')}}</textarea>


                        </div>

                    </div>
                    <div class="col-lg-12">
                            <input type="submit" value="حفظ" class="btn-save " style="width: 70%;text-align: center">
                     </div>
                </div>

            </form>



        </div>
    </div>


    <div class="modal fade brands_modal" tabindex="-1" role="dialog"
         aria-labelledby="gridSystemModalLabel">
    </div>

@endsection

@section('javascript')
    <script>
$(document).keyup('#notes #title',function () {
    $('.alert-danger').fadeOut();
});


    </script>


@endsection
