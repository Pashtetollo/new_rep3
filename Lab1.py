class Mower:
    mower_count = 0
    def __init__(self, mowing_width = 'UNKNOWN', power = 'UNKNOWN', tank_capacity = 'UNKNOWN', model_name='UNKNOWN', label = 'UNKNOWN', price = 'UNKNOWN', date = 'UNKNOWN'):
        self.mowing_width = mowing_width
        self.power = power
        self.model_name=model_name
        self.tank_capacity = tank_capacity
        self.label = label
        self.price = price
        self.date = date
        Mower.mower_count +=1
        print ("object initialized")
        
    def __del__(self):
        Mower.mower_count -=1
        print("destructor is called, object deleted")
        
    def __str__(self):
        return f"Name: {self.model_name}\nMowing width: {self.mowing_width} cm\nPower: {self.power} watts\nTank_capacity: {self.tank_capacity} litres\nLabel: {self.label}\nPrice: {self.price}$\nDate: {self.date} year\n\n"
    @classmethod
    def get_count(cls):
        return cls.mower_count
    
def main ():
    mower1 = Mower()
    mower2 = Mower(120, 100, 5, 'SupraMawer', 'Tesla', 989, 2018)
    mower3 = Mower(20, 10 ,0.5,'StrongMaw','NotAScam')
    print(str(Mower.get_count())+" objects")
    print(mower1)
    print (mower2)
    print(mower3)
    del mower1
    print(str(Mower.get_count())+" objects")
    del mower2
    del mower3
    
if __name__ == '__main__':
    main()
