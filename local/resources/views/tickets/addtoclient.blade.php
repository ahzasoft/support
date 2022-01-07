@extends('layouts.main')

@section('title','إضافة تذكرة')

@section('maincontent')
    <div class="content-wrapper" >
        <div class="pagecontainer">
          <input type="hidden" id="token" value="{{csrf_token()}}">
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

                <div class="row">
                    <div class="col-sm-12">
                        <table class="table myGridClass table-hover ">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>ticket_id</th>
                                <th>action</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($clients as $client)
                            <tr>
                                <td>{{$client->name}}</td>
                                <td>{{$client->id}}</td>
                                <td>
                                   @if($ticket->id ==$client->ticket_id)
                                       <button class="btn btn-danger" onclick="addtoclient({{$client->id,$ticket->id}})" >Delete</button>
                                    @else
                                       <button type="button" class="btn btn-primary" onclick="addtoclient({{$client->id,$ticket->id}})" >add</button>
                                       @endif
                                </td>
                            </tr>
                                @endforeach

                            </tbody>
                        </table>

                    </div>
                </div>





        </div>
    </div>


    <div class="modal fade brands_modal" tabindex="-1" role="dialog"
         aria-labelledby="gridSystemModalLabel">
    </div>

@endsection

@section('javascript')
    <script>

        function addtoclient(client_id,ticket_id) {
            var token=$('#token').val();

            $.ajax({
                type: 'POST',
                url: '/addtoclient',
                data: {
                    _token:token
                    ,client_id:client_id
                    ,ticket_id:ticket_id
                },
                success: function(result) {
                       alert('Ticket add to client'+result);

                },
            });
        }




    </script>


@endsection
