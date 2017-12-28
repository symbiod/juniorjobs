FactoryBot.define do
  sequence :title do |n|
    "Junior jobs № #{n}"
  end

  factory :job do
    title
    description 'Описание вакансии'
    employment_type 'полная занятость'
    city  'Москва'
    tasks "Разрабатывать API для мобильных и Web-приложений;
           Вносить изменения в существующую архитектуру системы;
           Предлагать решения для построения отказоустойчивой системы;
           Взимодействовать с другими разработчиками."
    requirements "Знание Ruby;
                  Опыт разработки RESTful API;
                  Умение проектировать распределенные приложения;
                  Знакомство с SQL;
                  BDD тестирование"
    condition ' Чай печеньки'
  end
end
