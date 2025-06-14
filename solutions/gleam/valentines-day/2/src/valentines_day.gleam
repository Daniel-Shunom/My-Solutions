pub type Approval {
  Yes
  No
  Maybe
}

pub type Cuisine {
  Korean
  Turkish
}

pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    Movie(Romance)     -> Yes
    Restaurant(Korean) -> Yes
    Restaurant(_)      -> Maybe
    Walk(i) if 11 < i  -> Yes
    Walk(i) if 6  < i  -> Maybe
    _                  -> No
  }
}
