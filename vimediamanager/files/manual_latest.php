<?php

  $hit_count = @file_get_contents('intel_count.txt');
  $hit_count++;
  @file_put_contents('intel_count.txt', $hit_count);

  header('Location: http://mariusth.channelwood.org/vimediamanager/files/user_manual.pdf'); // redirect to the real file to be downloaded
?>