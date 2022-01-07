@extends('layouts.guest')
@section('titel','Password Reset');
@section('maincontent')


        <div style="background: #FFFFFF;width: 350px;margin: auto;padding: 20px;border-radius: 10px" >
            @if (session('status'))
                <div class="mb-4 font-medium text-sm text-green-600">
                    {{ session('status') }}
                </div>
            @endif

        <form method="POST" action="{{ route('password.email') }}">
            @csrf

            <div class="block">
                <x-jet-label for="email" value="الإيميل" />
                <x-jet-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required autofocus />
            </div>

            <div class="flex items-center  mt-4">
                <x-jet-button>
                   إرسال
                </x-jet-button>
            </div>
        </form>
        </div>

    @endsection
