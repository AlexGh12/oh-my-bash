## laravel plugin

The laravel plugin helps to cut "artisan" commands in addition to making it easier to install your laravel projects

To use it, add laravel to the plugins array of your bashrc file:

```bash
plugins=(... laravel)
```

## Aliases

| Alias   | Command                            | Descripton                                                                |
|:------  |:-----------------------------------|:--------------------------------------------------------------------------|
| `pa_i`  | command string                     | Instala composer, copia .env, abre en vsc env, genera llave, storage link |
| `pa`    | `php artisan`                      | Cut `php artisan` (the other attributes are placed)                       |
| `pa_o`  | `php artisan optimize`             | Optimize project                                                          |
| `pa_m`  | `php artisan migrate`              | Run migrate                                                               |
| `pa_mb` | `php artisan migrate:rollback`     | Run migrate rollback                                                      |
| `pa_mf` | `php artisan migrate:fresh`        | Run run migration deleting all tables                                     |
| `pa_mfs`| `php artisan migrate:fresh --seed` | Run migration removing all seeded tables                                  |
| `pa_s`  | `php artisan serve`                | run local server                                                          |
| `pa_mk` | `php artisan make:[element]`       | Cut `php artisan make:` (the other attributes are placed)                 |
