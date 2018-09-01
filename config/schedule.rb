# Короче, я совсем перестал соображать, но вот что я выясни:
# вроде как можно тут в кавычках после "runner" указать модель и метод этой модели,
# типа runner "Messager.send_notification", но это не точно
# Как это протестить, я хз ибо даже как запустить не понял.
# Такие дела


every 1.day, at: ['10:00 am'] do #breakfast
  runner ""
end

every 1.day, at: ['12:00 pm'] do #perekus
  runner ""
end

every 1.day, at: ['3:00 pm'] do #lunch
  runner ""
end

every 1.day, at: ['5:00 pm'] do #perekus
  runner ""
end

every 1.day, at: ['8:00 pm'] do #dinner
  runner ""
end
