@extends('layouts.main')

@section('title','إضافة مشروع')

@section('maincontent')
    <div class="content-wrapper" >
        <div class="pagecontainer">
            <div>
                @if($project->id)
                    {{--edit current project --}}
                    {!! Form::open(['url' => action('ProjectController@update', [$project->id]), 'id' => 'role_form' ]) !!}
                        <input name="_method" type="hidden" value="PUT">
                    @else
                        {{--Add new project --}}
                    {!! Form::open(['url' => action('ProjectController@store'), 'method' => 'post' ]) !!}
                @endif
                    @csrf
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <input type="hidden" name="project_id" value="{{$project->id}}">
                    <div class="row">


                        <div class="col-4">
                            <div class="form-group">
                                <label for="name">إسم المشروع</label>
                                <input type="name" id="name" name="name" class="form-control"  value="{{$project->name}}">
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="" >حالة المشروع</label>
                                <select class="form-control" name="status">
                                    @foreach($project_status as $status)
                                       <option value="{{$status->id}}" @if($project->status==$status->id) selected @endif >     {{$status->project_status }}</option>
                                  @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="" >المسئول : </label>
                                <select class="form-control" name="responsble">
                                    @foreach($users as $status)
                                       <option value="{{$status->id}}"  @if($project->responsible==$status->id) selected @endif>{{$status->name }}</option>
                                  @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="" >صاحب المشروع : </label>
                                <select class="form-control" name="owner">
                                    @foreach($users as $status)
                                        <option value="{{$status->id}}"    @if($project->owner==$status->id) selected @endif  >{{$status->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>ملاحظات</label>
                        <textarea id="notes"  class="form-control" name="notes" rows="4" cols="50">
                            {!! $project->notes!!}}
                        </textarea>


                    </div>


                    <div style="margin: auto;width: 100%;text-align: center">
                        <input type="submit" value="حفظ" class="btn-save " style="width: 70%;text-align: center">

                    </div>
                    {!! Form::close() !!}
            </div>
        </div>
    </div>

@endsection

@section('javascript')
    <script>








    </script>


@endsection
