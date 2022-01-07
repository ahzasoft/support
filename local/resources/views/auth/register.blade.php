@extends('layouts.guest')
@section('titel','Register');
@section('maincontent')
    <div style="width: 350px;margin: auto;padding: 20px;border-radius: 10px;margin-top: 20px;background-color: #FFFF;" >
        <div style="">
            <img src="{{ asset('assets/images/login.png')}}" alt="login" style="margin: auto" >
        </div>
        {{-- @foreach ($errors->all() as $message) {
         <small class="text-danger">{{ $message }}</small>
             <br>
         @endforeach--}}

        <form method="POST" action="{{ route('register') }}">
            @csrf

            <div>
                <x-jet-label for="name" value="{{ __('auth.Name') }}" />
                <x-jet-input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name')" required autofocus autocomplete="name" />
                <small class="text-danger">{{ $errors->first('name') }}</small>
            </div>


            <div class="mt-4">
                <x-jet-label for="mobile" value="{{__('auth.Mobile')}}" />
                <x-jet-input id="mobile" class="block mt-1 w-full" type="text" name="mobile" :value="old('mobile')" required />
                <small class="text-danger">{{ $errors->first('mobile') }}</small>
            </div>

            <div class="mt-4">
                <x-jet-label for="email" value="{{ __('auth.Email') }}" />
                <x-jet-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required />
                <small class="text-danger">{{ $errors->first('email') }}</small>
            </div>

            <div class="mt-4">
                <x-jet-label for="password" value="{{ __('auth.Password') }}" />
                <x-jet-input id="password" class="block mt-1 w-full" type="password" name="password" required autocomplete="new-password" />
                <small class="text-danger">{{ $errors->first('password') }}</small>
            </div>

            <div class="mt-4">
                <x-jet-label for="password_confirmation" value="{{ __('auth.Confirm_Password') }}" />
                <x-jet-input id="password_confirmation" class="block mt-1 w-full" type="password" name="password_confirmation" required autocomplete="new-password" />
            </div>

            <div class="flex items-center justify-end mt-4 text-center">


                <x-jet-button class="ml-4">
                    {{ __('auth.Register') }}
                </x-jet-button>

            </div>
            <div>
                <a class="underline text-sm text-gray-600 hover:text-gray-900" href="{{ route('login') }}">
                    {{ __('auth.Already_registered?') }}
                </a>
            </div>
        </form>
    </div>
@endsection