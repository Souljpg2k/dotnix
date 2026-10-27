{
  services.hyprsunset = {
    enable = true;
    settings = {
      profile = [
        {
          time = "7:30";
          identity = true;
        }
        {
          time = "19:00";
          temperature = 4000;
          gamma = 1.0;
        }
      ];
    };
  };
}
