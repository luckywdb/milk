{application, milk,
    [{description, "An OTP application"},
     {vsn, "0.1.0"},
     {registered, [milk]},
     {mod, {milk_app, []}},
     {applications,
      [kernel,
       stdlib
      ]},
     {env, []},
     {modules, [milk_app,
                milk_sup,
                network_tcp_sup]},

     {maintainers, []},
     {licenses, ["Apache 2.0"]},
     {links, []}
    ]}.
