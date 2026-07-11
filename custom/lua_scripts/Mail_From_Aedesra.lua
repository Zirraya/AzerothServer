-- НАСТРОЙКИ СКРИПТА
local TARGET_LEVEL = 10       -- Уровень, на котором приходит письмо
local ITEM_ID = 90000         -- Замените на ID вашего кастомного предмета (сейчас стоит Сиамский кошелёк)
local NPC_ENTRY = 90001       -- ID вашей Аедесры из базы данных
local ITEM_COUNT = 1          -- Количество предметов

local function OnLevelChange(event, player, oldLevel)
    -- Проверяем, что игрок получил именно 10 уровень
    if player:GetLevel() == TARGET_LEVEL then
	
		if player:GetTeam() == 0 then
	
        local subject = "Важное послание!"
         local body = "Вижу твое путешествие хорошо продвигается. Этот зверь поможет тебе в твоих приключених. Я поймала его в Степях и заключила в этот амулет. Не волнуйся ему там хорошо. Не забудь меня посетить в Дарнасе рядом с Анлкавом Кенария. Я собираю зверей со всего Азерота и Запределья, и я с удовольствием поделюсь ими с тобой, если конечно ты пообещаешь хорошо о них заботиться. "
        
        -- ПОЛУЧАТЕЛЬ: Нам нужен Low GUID игрока
        local receiverGUID = player:GetGUIDLow()
        
		SendMail(subject, body, receiverGUID, 0, 41, 0, 0, 0, ITEM_ID, ITEM_COUNT)

        -- Выводим сообщение в чат игроку для дополнительной проверки
        player:SendBroadcastMessage("Вы получили письмо на почту от Аедесры!")
		
		end
    end
end

-- Регистрируем событие смены уровня
RegisterPlayerEvent(13, OnLevelChange)

