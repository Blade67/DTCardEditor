extends ViewportContainer

onready var CardCost = $Viewport/GridContainer/Right/Panel/GridContainer/CostInput
onready var CardName = $Viewport/GridContainer/Right/Panel/GridContainer/NameInput
onready var CardType = $Viewport/GridContainer/Right/Panel/GridContainer/TypeInput
onready var CardDeck = $Viewport/GridContainer/Right/Panel/GridContainer/DeckInput
onready var CardIcon = $Viewport/GridContainer/Right/Panel/GridContainer/IconInput
onready var CardDesc = $Viewport/GridContainer/Right/Panel/GridContainer/DescInput
onready var CardBrdr = $Viewport/GridContainer/Right/Panel/GridContainer/ColrInput

onready var Cost = $Viewport/GridContainer/MarginContainer/Left/Cost
onready var Name = $Viewport/GridContainer/MarginContainer/Left/Name
onready var Type = $Viewport/GridContainer/MarginContainer/Left/Type
onready var Icon = $Viewport/GridContainer/MarginContainer/Left/Icon
onready var Desc = $Viewport/GridContainer/MarginContainer/Left/Desc


onready var Background = $Viewport/GridContainer/MarginContainer/Left/Background
onready var Overlay = $Viewport/GridContainer/MarginContainer/Left/Overlay
onready var _viewport = $Viewport

func _ready() -> void:
    
    # Types
    CardType.add_item("ATTACK", 0)
    CardType.add_item("PASSIVE", 1)
    CardType.add_item("ABILITY", 2)
    CardType.add_item("HANDICAP", 3)
    
    # Deck
    CardDeck.add_item("Warrior", 0)
    CardDeck.add_item("Warlock", 1)
    setDeck(0)
    
    Cost.text = str(CardCost.value)
    Name.text = CardName.text
    Type.text = CardType.get_item_text(CardType.selected)
    Icon.texture = load("res://Cards/" + CardDeck.get_item_text(CardDeck.selected) + "/" + CardIcon.get_item_text(CardIcon.selected) + ".png")
    Desc.bbcode_text = "[center]" + CardDesc.text + "[/center]"


func _on_CostInput_value_changed(value: float) -> void:
    Cost.text = str(value)


func _on_NameInput_text_changed(text: String) -> void:
    Name.text = text


func _on_IconInput_item_selected(id: int) -> void:
    update_icon(id)


func update_icon(id:int=0) -> void:
    Icon.texture = load("res://Cards/" + CardDeck.get_item_text(CardDeck.selected) + "/" + CardIcon.get_item_text(id) + ".png")


func _on_TypeInput_item_selected(id: int) -> void:
    Type.text = CardType.get_item_text(id)
    setIconType(id)

func setIconType(id: int) -> void:
    print("res://Cards/" + CardType.get_item_text(id) + "CardTemplate.png")
    Background.texture = load("res://Cards/" + CardType.get_item_text(id) + "CardTemplate.png")


func _on_DescInput_text_changed() -> void:
    Desc.bbcode_text = "[center]" + CardDesc.text + "[/center]"


func _on_Export_pressed() -> void:
    var img = _viewport.get_texture().get_data()
    img.convert(Image.FORMAT_RGBA8)
    img.flip_y()
    img = img.get_rect(Rect2(16,16, 448, 708))
    img.save_png("%s.png" % Name.text)


func _on_DeckInput_item_selected(id: int) -> void:
    CardIcon.clear()
    setDeck(id)
    update_icon()

func setDeck(id: int) -> void:
    if id == 0:
        # Cards - Warrior
        CardIcon.add_item("Batter", 0)
        CardIcon.add_item("Berserker Rage", 1)
        CardIcon.add_item("Blood Pact", 2)
        CardIcon.add_item("Blood Ritual", 3)
        CardIcon.add_item("Boomerang", 4)
        CardIcon.add_item("Bound", 5)
        CardIcon.add_item("Brainstorm", 6)
        CardIcon.add_item("Bulk Up", 7)
        CardIcon.add_item("Cautious", 8)
        CardIcon.add_item("Channel Pain", 9)
        CardIcon.add_item("Cleave", 10)
        CardIcon.add_item("Convert", 11)
        CardIcon.add_item("Dead Weight", 12)
        CardIcon.add_item("Decimate", 13)
        CardIcon.add_item("Demonic Growth", 14)
        CardIcon.add_item("Desperate Defense", 15)
        CardIcon.add_item("Devour", 16)
        CardIcon.add_item("Diamond Body", 17)
        CardIcon.add_item("Double Strike", 18)
        CardIcon.add_item("Double Up", 19)
        CardIcon.add_item("Drain", 20)
        CardIcon.add_item("Effortless Blow", 21)
        CardIcon.add_item("Enfeeble", 22)
        CardIcon.add_item("Ethereal Armor", 23)
        CardIcon.add_item("Exploit Weakness", 24)
        CardIcon.add_item("Fazed", 25)
        CardIcon.add_item("Filter", 26)
        CardIcon.add_item("Finisher", 27)
        CardIcon.add_item("Focus", 28)
        CardIcon.add_item("Guard", 29)
        CardIcon.add_item("Havoc", 30)
        CardIcon.add_item("Heavy Strike", 31)
        CardIcon.add_item("Hell Blade", 32)
        CardIcon.add_item("Hellscream", 33)
        CardIcon.add_item("Hoarder", 34)
        CardIcon.add_item("Injury", 35)
        CardIcon.add_item("Kubiroh", 36)
        CardIcon.add_item("Last Dab", 37)
        CardIcon.add_item("Lifebreak", 38)
        CardIcon.add_item("Living Armor", 39)
        CardIcon.add_item("Overthinker", 40)
        CardIcon.add_item("Pacifism", 41)
        CardIcon.add_item("Pay With Blood", 42)
        CardIcon.add_item("Pebbles", 43)
        CardIcon.add_item("Pile-up", 44)
        CardIcon.add_item("Pillage", 45)
        CardIcon.add_item("Preparation", 46)
        CardIcon.add_item("Quantum", 47)
        CardIcon.add_item("Rack", 48)
        CardIcon.add_item("Recklessness", 49)
        CardIcon.add_item("Recuperate", 50)
        CardIcon.add_item("Recycle", 51)
        CardIcon.add_item("Remember", 52)
        CardIcon.add_item("Retreat", 53)
        CardIcon.add_item("Revenge", 54)
        CardIcon.add_item("Riposte", 55)
        CardIcon.add_item("Safeguard", 56)
        CardIcon.add_item("Salvage", 57)
        CardIcon.add_item("Scrapper", 58)
        CardIcon.add_item("Shield Bash", 59)
        CardIcon.add_item("Shiv", 60)
        CardIcon.add_item("Slash", 61)
        CardIcon.add_item("Slug", 62)
        CardIcon.add_item("Suit Up", 63)
        CardIcon.add_item("Tactics", 64)
        CardIcon.add_item("ThunderClap", 65)
        CardIcon.add_item("Tower Shield", 66)
        CardIcon.add_item("Troll Blood", 67)
        CardIcon.add_item("Turtle Stance", 68)
        CardIcon.add_item("Unleash", 69)
    else:
        # Cards - Warlock
        CardIcon.add_item("Accelerate",0)
        CardIcon.add_item("Aftershock",1)
        CardIcon.add_item("Agonize",2)
        CardIcon.add_item("Amplify",3)
        CardIcon.add_item("Blight",4)
        CardIcon.add_item("Calamity",5)
        CardIcon.add_item("Catalyst",6)
        CardIcon.add_item("Chaos Orb",7)
        CardIcon.add_item("Contagion",8)
        CardIcon.add_item("Contaminate",9)
        CardIcon.add_item("Cripple",10)
        CardIcon.add_item("Cull the Weak",11)
        CardIcon.add_item("Dark Bargain",12)
        CardIcon.add_item("Dark Inquiry",13)
        CardIcon.add_item("Dark Pact",14)
        CardIcon.add_item("Dark Touch",15)
        CardIcon.add_item("Deadly Coating",16)
        CardIcon.add_item("Delirium",17)
        CardIcon.add_item("Demonic Vigor",18)
        CardIcon.add_item("Diabolic Vision",19)
        CardIcon.add_item("Dread",20)
        CardIcon.add_item("Echoing Blast",21)
        CardIcon.add_item("Essence Drain",22)
        CardIcon.add_item("Finger of Death",23)
        CardIcon.add_item("Harvest",24)
        CardIcon.add_item("Hellfire",25)
        CardIcon.add_item("Hinder",26)
        CardIcon.add_item("Infest",27)
        CardIcon.add_item("Last Resort",28)
        CardIcon.add_item("Magic Missile",29)
        CardIcon.add_item("Malice",30)
        CardIcon.add_item("Mass Hysteria",31)
        CardIcon.add_item("Mind Blast",32)
        CardIcon.add_item("Mind Rake",33)
        CardIcon.add_item("Mind Salvage",34)
        CardIcon.add_item("Nausea",35)
        CardIcon.add_item("Noxious Salvage",36)
        CardIcon.add_item("Outbreak",37)
        CardIcon.add_item("Plague",38)
        CardIcon.add_item("Premeditate",39)
        CardIcon.add_item("Rapid Decay",40)
        CardIcon.add_item("Reave Soul",41)
        CardIcon.add_item("Recharge",42)
        CardIcon.add_item("Restless",43)
        CardIcon.add_item("Shadow Blast",44)
        CardIcon.add_item("Shadow Form",45)
        CardIcon.add_item("Shadow Shield",46)
        CardIcon.add_item("Shadowfury",47)
        CardIcon.add_item("Siphon Life",48)
        CardIcon.add_item("Soul Conversion",49)
        CardIcon.add_item("Soul Feast",50)
        CardIcon.add_item("Soul Spike",51)
        CardIcon.add_item("Soul Steal",52)
        CardIcon.add_item("Soulblast",53)
        CardIcon.add_item("Soulquake",54)
        CardIcon.add_item("Soulwell",55)
        CardIcon.add_item("Spellbind",56)
        CardIcon.add_item("Tainted Touch",57)
        CardIcon.add_item("Unholy Vision",58)
        CardIcon.add_item("Vile Funnel",59)
        CardIcon.add_item("Void Strike",60)
        CardIcon.add_item("Wailing Death",61)
        CardIcon.add_item("Weaken",62)
        CardIcon.add_item("Wicked Strike",63)
        CardIcon.add_item("Wither",64)


func _on_ColorPicker_color_changed(color: Color) -> void:
    Overlay.modulate = color


func _on_ColrInput_picker_created() -> void:
    $Viewport/GridContainer/Right/Panel/GridContainer/ColrInput.get_child(0).get_child(0).get_child(1).get_child(1).queue_free()
