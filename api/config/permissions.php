<?php

return [
    'user_type_changes' => [
        'Administrador' => ['Administrador', 'Gente e Cultura', 'Colaborador Comum'],
        'Gente e Cultura' => ['Gente e Cultura', 'Colaborador Comum'],
        'Colaborador Comum' => []
    ],

    // Perfis que podem convidar novos colaboradores
    'can_invite_users' => ['Administrador', 'Gente e Cultura']
];
