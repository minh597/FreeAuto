# calculator_menu.py

def add(a, b):
    return a + b

def sub(a, b):
    return a - b

def mul(a, b):
    return a * b

def div(a, b):
    if b == 0:
        return "❌ Không thể chia cho 0"
    return a / b

def power(a, b):
    return a ** b

def calculator():
    while True:
        print("\n=== MÁY TÍNH PYTHON ===")
        print("1. Cộng")
        print("2. Trừ")
        print("3. Nhân")
        print("4. Chia")
        print("5. Lũy thừa")
        print("0. Thoát")
        
        choice = input("Chọn phép tính (0-5): ")
        
        if choice == "0":
            print("👋 Thoát chương trình...")
            break
        
        if choice in ["1", "2", "3", "4", "5"]:
            try:
                x = float(input("Nhập số thứ nhất: "))
                y = float(input("Nhập số thứ hai: "))
            except ValueError:
                print("⚠️ Vui lòng nhập số hợp lệ!")
                continue

            if choice == "1":
                print(f"Kết quả: {x} + {y} = {add(x, y)}")
            elif choice == "2":
                print(f"Kết quả: {x} - {y} = {sub(x, y)}")
            elif choice == "3":
                print(f"Kết quả: {x} * {y} = {mul(x, y)}")
            elif choice == "4":
                print(f"Kết quả: {x} / {y} = {div(x, y)}")
            elif choice == "5":
                print(f"Kết quả: {x} ^ {y} = {power(x, y)}")
        else:
            print("⚠️ Lựa chọn không hợp lệ!")

if __name__ == "__main__":
    calculator()
