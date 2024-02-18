n = 6
m = 3 # All rabbits live for m months (Now)
# Populate the initial rabbits.
Rabbits = [1]+[0]*(m-1) # Represents the following months without any rabbits

# Calculate the new rabbits (bunnies), in a given year.
# Start at use range(1,n) since our initial population is year 0.
for year in range(1, n):
    Bunnies = 0
    # Get the number of Rabbits able to old enough to give birth.
    for j in range(1,m):
        Bunnies += Rabbits[(year-j-1)%m] 
    # Bunnies replace the old rabbits who died.
    Rabbits[(year)%m] = Bunnies # %m is used to iterate over Rabbits indices when they exceed the list's limit

# Total rabbits is the sum of the living rabbits.
Total_Rabbits = sum(Rabbits)

print(Total_Rabbits)