import { shallow } from '@vue/test-utils'
import Grid from 'components/grid'

describe('Grid', () => {
    const wrapper = shallow(Grid, {
        methods: {
            fetch: () => {}
        }
    })

    it('renders the correct markup', () => {
        expect(wrapper.html()).toContain('<b-table')
    })
})