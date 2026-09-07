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

from pyrogram import filters, types

from Music420bot import app, db
from Music420bot.helpers import can_manage_vc


@app.on_message(filters.command(["autoplay", "cautoplay"]) & filters.group & ~app.bl_users)
@can_manage_vc
async def _autoplay(_, m: types.Message):
    try:
        await m.delete()
    except Exception:
        pass

    # Determine target chat_id:
    # - /cautoplay → explicitly use linked channel
    # - /autoplay  → use channel if channel-play is active, else group
    is_explicit_channel = m.command[0].lower() == "cautoplay"
    chat_id = m.chat.id

    channel_id = await db.get_cmode(m.chat.id)

    if is_explicit_channel:
        if channel_id is None:
            return await m.reply_text(
                "<blockquote>❌ Channel play is not enabled.\n\n"
                "Use /channelplay to enable it first.</blockquote>"
            )
        chat_id = channel_id
    elif channel_id is not None:
        # /autoplay in a group that has channel-play active → target channel
        chat_id = channel_id

    current = await db.get_autoplay(chat_id)

    # Toggle autoplay
    new_state = not current
    await db.set_autoplay(chat_id, new_state)

    if new_state:
        text = (
            "<blockquote>🎵 <b>Autoplay: ON</b>\n\n"
            "Ek baar /play karo — baaki songs apne aap bajte rahenge!\n"
            "Queue khatam hone par main automatically similar song dhundh kar bajata rahunga.\n\n"
            "Band karne ke liye dobara /autoplay karo.</blockquote>"
        )
    else:
        text = (
            "<blockquote>⏹ <b>Autoplay: OFF</b>\n\n"
            "Autoplay band kar diya. Queue khatam hone par playback ruk jayega.\n\n"
            "Dobara chalu karne ke liye /autoplay karo.</blockquote>"
        )

    await m.reply_text(text)
