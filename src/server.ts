import Fastify from 'fastify'
import healthcheck from 'fastify-healthcheck'

const fastify = Fastify({
	logger: true,
})

fastify.register(healthcheck)

fastify.get('/', async (request, reply) => {
	reply.type('application/json').code(200)
	return { hello: 'world' }
})

fastify.listen({ port: 80 }, (err, address) => {
	console.log(`!!! server listening on ${address}`)
	if (err) throw err
})
