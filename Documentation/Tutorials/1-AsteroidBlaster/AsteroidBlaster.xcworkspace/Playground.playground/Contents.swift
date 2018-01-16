import Foundation
import PlaygroundSupport
import ImagineEngine

class AsteroidBlasterScene: Scene {
    override func setup() {
        backgroundColor = Color(red: 0, green: 0, blue: 0.3, alpha: 1)
        
        //
        let groundSize = Size(width: size.width, height: 100)
        let ground = Block(size: groundSize, textureCollectionName: "Ground" )
        add(ground)
        
        
        ground.position.x = center.x
        ground.position.y = size.height - groundSize.height / 2
        
        let housesGroup = Group.name("Houses")
        
        for x in stride(from: center.x - 100, to: center.x + 150, by: 50) {
            let house = Actor()
            house.group = housesGroup
            house.animation = Animation(name: "House", frameCount: 1, frameDuration: 0)
            add(house)
            
            house.position.x = x
            house.position.y = ground.rect.minY - house.size.height / 2
            
            timeline.repeat(withInterval: 2, using: self) { scene in
                
                let asteroid = Actor()
                asteroid.animation = Animation(name: "Asteroid", frameCount: 1, frameDuration: 0)
                scene.add(asteroid)
            
                let positionRange = scene.size.width - asteroid.size.width
                let randomPosition = Metric(arc4random() % UInt32(positionRange))
                asteroid.position.x = asteroid.size.width / 2 + randomPosition
            
                asteroid.velocity.dy = 400
                
            
            }
        }

        timeline.repeat(withInterval: 2, using: self) { scene in
            
            let asteroid = Actor()
            asteroid.animation = Animation(name: "Asteroid", frameCount: 1, frameDuration: 0)
            scene.add(asteroid)
            
            let positionRange = scene.size.width - asteroid.size.width
            let randomPosition = Metric(arc4random() % UInt32(positionRange))
            asteroid.position.x = asteroid.size.width / 2 + randomPosition
            
            asteroid.velocity.dy = 400
            
    }
    
}


let sceneSize = Size(width: 375, height: 667)
let scene = AsteroidBlasterScene(size: sceneSize)
PlaygroundPage.current.liveView = GameViewController(scene: scene)


}
