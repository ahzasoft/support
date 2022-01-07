<div class="modal-dialog" role="document">
    <div class="modal-content">

        {!! Form::open(['url' => action('ClientsController@savepayment'), 'method' => 'post' ]) !!}

        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

        </div>

        <div class="modal-body">
            <div >
                <h5>العميل : {{$client->name}}</h5>
                <input type="hidden" name="client_id" value="{{$client->id}}">
            </div>
            <br>
            <div class="form-group">
                {!! Form::label('value','القيمة المسددة :*') !!}
                {!! Form::text('value', null, ['class' => 'form-control', 'required', 'placeholder' =>'القيمة' ]); !!}
            </div>
            <div class="form-group">
                {!! Form::label('value','تاريخ السداد :*') !!}
                {!! Form::text('value', null, ['class' => 'form-control txtDatePicker', 'required', 'placeholder' =>'تاريخ السداد' ]); !!}
            </div>


            <div class="form-group">
                {!! Form::label('notes',' ملاحظات :') !!}
                {!! Form::text('notes', null, ['class' => 'form-control', 'required', 'placeholder' =>'ملاحظات' ]); !!}
            </div>


        </div>

        <div class="modal-footer">
            <button type="submit" class="btn btn-primary">حفظ</button>
            <button type="button" class="btn btn-dark" data-dismiss="modal">غلق</button>
        </div>

        {!! Form::close() !!}

    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

<script>

    $('.txtDatePicker').datepicker({
        dateFormat: 'yy-mm-d',
        changeMonth: true,
        changeYear: true,
        yearRange: '2020:2030'

    });

</script>
