describe 'Rng', ->
  describe '#isConnected', ->
    it 'should not be connected with wrong address', (done)->
      rng = new Rng('fakeaddress.com', 8080)
      test = ->
        rng.isConnected().should.not.be.ok
        rng.socket.close()
        done()  
      setTimeout(test, 200)
    it 'should be connected with good address', (done) ->
      rng = new Rng('localhost', 8080)
      test = ->
        rng.isConnected().should.be.ok
        rng.socket.close()
        done()  
      setTimeout(test, 200)
    it 'should call onNumbers callback with numbers', (done) ->
      rng = new Rng('localhost', 8080)
      rng.onNumbers((numbers)-> 
        numbers.should.be.instanceof(Uint8Array).and.have.lengthOf(25)
        rng.socket.close()
        done()
        )
      console.log rng.numbersCb