# ==========================================================
# Copyright (c) 2026 Music420bot
# All Rights Reserved.
# Powered By   : @yoi_420
# Type         : Telegram Music Bot
#
# 
#
# Channel      : https://t.me/BOT420_UPDATE
# 
#
# Unauthorized copying, modification, or redistribution
# of this source code without permission is prohibited.
# ==========================================================
from dataclasses import dataclass


@dataclass
class Media:
    id: str
    duration: str
    duration_sec: int
    file_path: str
    message_id: int
    title: str
    url: str
    time: int = 0
    user: str = None
    user_id: int = None
    is_live: bool = False
    video: bool = False  # ← ADDED


@dataclass
class Track:
    id: str
    channel_name: str
    duration: str
    duration_sec: int
    title: str
    url: str
    file_path: str = None
    message_id: int = 0
    time: int = 0
    thumbnail: str = None
    user: str = None
    user_id: int = None
    view_count: str = None
    is_live: bool = False
    video: bool = False  # ← ADDED
