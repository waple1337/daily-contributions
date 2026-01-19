#!/usr/bin/env python3
"""
Генератор ежедневных данных для коммита
"""
import json
import random
from datetime import datetime

def generate_daily_data():
    """Генерирует случайные данные на день"""
    activities = [
        "coding", "reading", "learning", "exercising", 
        "meeting", "planning", "debugging", "refactoring",
        "testing", "documenting", "designing", "reviewing"
    ]
    
    data = {
        "date": datetime.now().strftime("%Y-%m-%d"),
        "timestamp": datetime.now().isoformat(),
        "activities": random.sample(activities, k=random.randint(2, 5)),
        "random_number": random.randint(1, 1000),
        "mood": random.choice(["great", "good", "productive", "focused", "creative"]),
        "lines_of_code": random.randint(50, 500)
    }
    
    return data

def main():
    try:
        # Читаем существующий файл, если он есть
        try:
            with open('daily-log.json', 'r', encoding='utf-8') as f:
                log = json.load(f)
        except FileNotFoundError:
            log = {"entries": []}
        
        # Добавляем новую запись
        new_entry = generate_daily_data()
        log["entries"].append(new_entry)
        
        # Сохраняем обновленный файл
        with open('daily-log.json', 'w', encoding='utf-8') as f:
            json.dump(log, f, indent=2, ensure_ascii=False)
        
        print(f"✅ Данные за {new_entry['date']} успешно добавлены!")
        
    except Exception as e:
        print(f"❌ Ошибка: {e}")
        exit(1)

if __name__ == "__main__":
    main()

