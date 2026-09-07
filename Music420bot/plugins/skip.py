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

import asyncio
import logging
from pyrogram import filters, types
from pyrogram.errors import ChatSendPlainForbidden, ChatWriteForbidden

from Music420bot import tune, app, db, lang
from Music420bot.helpers import can_manage_vc

logger = logging.getLogger(__name__)


@app.on_message(filters.command(["skip", "next", "cskip", "cnext"]) & filters.group & ~app.bl_users)
@lang.language()
@can_manage_vc
async def _skip(_, m: types.Message):
    try:
        await m.delete()
    except Exception:
        pass
    
    # Check for channel play mode
    is_channel = m.command[0].lower() in ["cskip", "cnext"]
    chat_id = m.chat.id
    
    if is_channel:
        channel_id = await db.get_cmode(m.chat.id)
        if channel_id is None:
            return await m.reply_text("Channel play is not enabled. Use /channelplay to enable.")
        chat_id = channel_id
    
    if not await db.get_call(chat_id):
        try:
            return await m.reply_text("Nothing is playing.")
        except (ChatSendPlainForbidden, ChatWriteForbidden):
            return

    await tune.play_next(chat_id)
    try:
        sent_msg = await m.reply_text(f"Skipped by {m.from_user.mention}")
    except (ChatSendPlainForbidden, ChatWriteForbidden):
        logger.warning("Cannot send plain text in media-only chat")
        return
    
    await asyncio.sleep(5)
    try:
        await sent_msg.delete()
    except Exception:
        pass
