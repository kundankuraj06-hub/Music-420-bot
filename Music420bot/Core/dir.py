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
from pathlib import Path

from Music420bot import logger


def ensure_dirs():
    """
    Create necessary directories if they don't exist.

    Creates:
    - cache/: For temporary cache files
    - downloads/: For downloaded media files
    """
    # List of required directories
    for dir in ["cache", "downloads"]:
        # Create directory (and parents if needed)
        Path(dir).mkdir(parents=True, exist_ok=True)
    logger.info("📁 Cache directories updated.")
