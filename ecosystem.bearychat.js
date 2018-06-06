module.exports = {
  /**
   * Application configuration section
   * http://pm2.keymetrics.io/docs/usage/application-declaration/
   */
  apps : [

    // First application
    {
      name      : 'robot',
      script    : './bin/hubot',
      exec_interpreter: "bash",
      exec_mode : "fork_mode",
      watch: true,
      env: {
        COMMON_VARIABLE: 'true'
      },
      env_production : {
        NODE_ENV: 'production'
      },
      args: [
        "-a", "bearychat"
      ]
    },
  ],
};
