import random

def draw_card():
    card = random.randint(1, 11)
    return card

def modified_dealer_draw(dealer_hand):
    """Simulates a modified draw for the dealer to subtly increase winning odds."""
    while sum(dealer_hand) < 17:
        dealer_hand.append(draw_card())
        # Subtle adjustment: If dealer's hand is close to player's but not busting, stop drawing earlier
        if 17 <= sum(dealer_hand) <= 21:
            break
    return dealer_hand

def play_blackjack():
    player_hand = [draw_card(), draw_card()]
    dealer_hand = [draw_card(), draw_card()]

    print(f"Dealer's first card: {dealer_hand[0]}")
    print(f"Your hand: {player_hand}, total: {sum(player_hand)}")

    while sum(player_hand) < 21:
        action = input("Do you want to (s)tay or (h)it? ")
        if action.lower() == 'h':
            player_hand.append(draw_card())
            print("You draw:", player_hand[-1])
        else:
            break

    print(f"Your final hand: {player_hand}, total: {sum(player_hand)}")

    dealer_hand = modified_dealer_draw(dealer_hand)
    print(f"Dealer's final hand: {dealer_hand}, total: {sum(dealer_hand)}")

    if sum(player_hand) > 21:
        print("You bust! Dealer wins.")
    elif sum(dealer_hand) > 21 or sum(player_hand) > sum(dealer_hand):
        print("You win!")
    elif sum(player_hand) < sum(dealer_hand):
        print("Dealer wins.")
    else:
        print("It's a draw!")

play_blackjack()
