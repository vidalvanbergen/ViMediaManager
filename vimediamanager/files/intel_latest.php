<?php

  $hit_count = @file_get_contents('intel_count.txt');
  $hit_count++;
  @file_put_contents('intel_count.txt', $hit_count);

  header('Location: http://mariusth.channelwood.org/vimediamanager/files/vimediamanager.dmg'); // redirect to the real file to be downloaded
?>