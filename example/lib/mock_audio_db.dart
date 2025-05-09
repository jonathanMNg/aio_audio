import 'package:audio_player_base/audio_player_base.dart';

final List<ApbUrlPlayableAudio> audioList = [
  ApbUrlPlayableAudio(
    id: '1',
    name: 'Sample Audio 1',
    fileUrl:
        'https://jnapp2.b-cdn.net/Nhac-Phat-Giao/bat-nha-ba-la-mat-da-tam-kinh-quynh-trang.mp3',
    imageUrl:
        'https://res.cloudinary.com/jnappdev/image/upload/v1684756638/kinhtritung/images/Nghi_Th%E1%BB%A9c_S%C3%A1m_H%E1%BB%91i_S%C3%A1u_C%C4%83n.jpg',
    contributors: ['Artist 1'],
    duration: Duration(seconds: 180),
    position: Duration(seconds: 30),
    playlistId: 'playlist_1',
  ),
  ApbUrlPlayableAudio(
    id: '2',
    name: 'Sample Audio 2',
    fileUrl:
        'https://jnapp2.b-cdn.net/Nhac-Phat-Giao/chu-dai-bi-tieng-viet-ngan-tay-kim-linh.mp3',
    imageUrl:
        'https://res.cloudinary.com/jnappdev/image/upload/v1682510748/kinhtritung/images/nhac_thien.jpg',
    contributors: ['Artist 2'],
    playlistId: 'playlist_1',
    duration: Duration(seconds: 180),
    position: Duration(seconds: 40),
  ),
  ApbUrlPlayableAudio(
    id: '3',
    name: 'Sample Audio 3',
    fileUrl:
        'https://jnapp2.b-cdn.net/Nhac-Phat-Giao/luat-doi-quynh-trang.mp3',
    imageUrl:
        'https://res.cloudinary.com/jnappdev/image/upload/v1682509536/kinhtritung/images/chu_dai_bi_nhac_hoa.jpg',
    contributors: ['Artist 3'],
    playlistId: 'playlist_1',
    duration: Duration(seconds: 180),
    position: Duration(seconds: 50),
  ),
  ApbUrlPlayableAudio(
    id: '4',
    name: 'Sample Audio 4',
    fileUrl:
    'https://jnapp2.b-cdn.net/Nhac-Phat-Giao/ve-voi-phat-quynh-trang.mp3',
    imageUrl:
    'https://res.cloudinary.com/jnappdev/image/upload/v1682509536/kinhtritung/images/chu_dai_bi_nhac_hoa.jpg',
    contributors: ['Artist 4'],
    playlistId: 'playlist_1',
    duration: Duration(seconds: 180),
    position: Duration(seconds: 50),
  ),
]; 

final ApbPlayablePlaylist mockPlaylist = ApbPlayablePlaylist(
  id: 'playlist_1',
  name: 'Sample Playlist',
  audios: audioList,
);

