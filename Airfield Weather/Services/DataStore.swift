//
//  DataStore.swift
//  Airfield Weather
//
//  Created by Vic on 31.01.2024.
import Foundation

final class DataStore {
    static let shared = DataStore()
    private init() {}
    
    let icaoCodes = [
        "UHMA",
        "UHPP",
        "UHSS",
        "UHHH",
        "UHBB",
        "UHWW",
        "UIII",
        "UWLW",
        "UWGG",
        "UUDD",
        "UUWW",
        "UUEE",
        "URMM",
        "URSS",
        "URKK",
        "URRP",
        "UWPP",
        "USTR",
        "USCC",
        "USNN",
        "USPP",
        "USRR",
        "USCM",
        "UWWW",
        "UWOO"
    ]
    
    let cityNames = [
        "Аэропорт Угольный, Анадырь",
        "Аэропорт Южно-Сахалинск, Южно-Сахалинск",
        "Аэропорт Хабаровск, Хабаровск",
        "Аэропорт Новый, Хабаровск",
        "Аэропорт Братск, Братск",
        "Аэропорт Владивосток, Владивосток",
        "Аэропорт Иркутск, Иркутск",
        "Аэропорт Восточный, Улан-Удэ",
        "Аэропорт Пулково, Санкт-Петербург",
        "Аэропорт Домодедово, Москва",
        "Аэропорт Внуково, Москва",
        "Аэропорт Шереметьево, Москва",
        "Аэропорт Минеральные Воды, Минеральные Воды",
        "Аэропорт Адлер-Сочи, Сочи",
        "Аэропорт Пашковский, Краснодар",
        "Аэропорт Платов, Ростов-на-Дону",
        "Аэропорт Большое Савино, Пермь",
        "Аэропорт Рощино, Екатеринбург",
        "Аэропорт Челябинск, Челябинск",
        "Аэропорт Нижневартовск, Нижневартовск",
        "Аэропорт Большой Улуй, Петропавловск-Камчатский",
        "Аэропорт Большое Грызлово, Сыктывкар",
        "Аэропорт Сургут, Сургут",
        "Аэропорт Курумоч, Самара",
        "Аэропорт Оренбург, Оренбург"
    ]
}