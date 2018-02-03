<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

//        DB::table('users')->insert([
//            'name' => str_random(10),
//            'email' => str_random(10).'@gmail.com',
//            'mobile' => '151'.rand('10000000','99999999'),
//            'password' => bcrypt('123456'),
//        ]);

        factory(App\User::class, 50)->create();
    }
}
